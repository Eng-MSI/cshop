package CanShop.Servlets;

import CanShop.DAO.ProductDAO;
import CanShop.POJOS.Products;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadImageServlet extends HttpServlet {

    private ServletFileUpload uploader = null;
    Products product = null;

    @Override
    public void init() throws ServletException {
        DiskFileItemFactory fileFactory = new DiskFileItemFactory();
        File filesDir = (File) getServletContext().getAttribute("FILES_DIR_FILE");
        fileFactory.setRepository(filesDir);
        this.uploader = new ServletFileUpload(fileFactory);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!ServletFileUpload.isMultipartContent(req)) {
            throw new ServletException("Content type is not multipart/form-data");
        }
        try {
            List<FileItem> fileItemsList = uploader.parseRequest(req);
            Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();
            int productId = 0;
            int imageNo = 0;
            while (fileItemsIterator.hasNext()) {
                FileItem fileItem = fileItemsIterator.next();
                if (fileItem.getFieldName().equals("productId")) {
                    productId = Integer.parseInt(fileItem.getString());
                } else if (fileItem.getFieldName().equals("imageNo")) {
                    System.out.println("string=" + fileItem.getString());
                    imageNo = Integer.parseInt(fileItem.getString());
                } else if (fileItem.getFieldName().equals("homePageImage")) {
                    ProductDAO productDAO = new ProductDAO();
                    product = productDAO.getProductById(productId);
                    System.out.println("FieldName=" + fileItem.getFieldName());
                    System.out.println("FileName=" + fileItem.getName());
                    System.out.println("ContentType=" + fileItem.getContentType());
                    System.out.println("Size in bytes=" + fileItem.getSize());
                    String contentType = fileItem.getContentType();
                    String extension = contentType.substring(contentType.indexOf('/') + 1);

                    File file = new File(req.getServletContext().getAttribute("FILES_DIR") + File.separator +"featured_"+ product.getProductName() + "_" + productId + ".png");
                    System.out.println("Absolute Path at server=" + file.getAbsolutePath());
                    fileItem.write(file);
                } else {
                    ProductDAO productDAO = new ProductDAO();
                    product = productDAO.getProductById(productId);
                    System.out.println("FieldName=" + fileItem.getFieldName());
                    System.out.println("FileName=" + fileItem.getName());
                    System.out.println("ContentType=" + fileItem.getContentType());
                    System.out.println("Size in bytes=" + fileItem.getSize());
                    String contentType = fileItem.getContentType();
                    String extension = contentType.substring(contentType.indexOf('/') + 1);

                    File file = new File(req.getServletContext().getAttribute("FILES_DIR") + File.separator + product.getProductName() + "_" + productId + "_" + imageNo + ".png");
                    System.out.println("Absolute Path at server=" + file.getAbsolutePath());
                    fileItem.write(file);
                }

            }
        } catch (FileUploadException e) {
//			out.write("Exception in uploading file.");
        } catch (Exception e) {
//			out.write("Exception in uploading file.");
        }
//		out.write("</body></html>");
        req.setAttribute("product", product);
        req.getRequestDispatcher("/admin/admin_add_images.jsp").forward(req, resp);
    }

}
